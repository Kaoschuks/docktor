package healthcheck 

import (
	"testing"
)

func TestPerform(t *testing.T) {
	result := PerformHealthCheck()
	if (result != nil) {
		t.Errorf("Error in creating health check: %s", result)
	}else {
		t.Logf("Succesfully created new container")
	}
}

