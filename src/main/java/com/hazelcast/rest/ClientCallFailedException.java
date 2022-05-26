package com.hazelcast.rest;

import java.util.List;

import com.hazelcast.client.impl.protocol.exception.ErrorHolder;

public class ClientCallFailedException extends RuntimeException {

    private static final long serialVersionUID = 1L;
    private final List<ErrorHolder> err;

    public ClientCallFailedException(List<ErrorHolder> err) {
        this.err = err;
    }

    public List<ErrorHolder> getErr() {
        return err;
    }
}
