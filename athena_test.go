package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "localhost:8080", nil)

	if err != nil {
		t.Fatalf("could not create request: %v", err)
	}
	rec := httptest.NewRecorder()
	handler(rec, req)

	if rec.Code != http.StatusOK {
		t.Errorf("expected status OK; got %v", rec.Code)
	}
	if !strings.Contains(rec.Body.String(), "Hello seal") {
		t.Errorf("unexpected body in response: %q", rec.Body.String())
	}
}
