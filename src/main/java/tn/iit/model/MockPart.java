package tn.iit.model;
import javax.servlet.http.Part;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import java.io.*;

public class MockPart implements Part {
    private File file;

    public MockPart(File file) {
        this.file = file;
    }

    @Override
    public InputStream getInputStream() throws IOException {
        return new FileInputStream(file);
    }

    @Override
    public String getContentType() {
        return null;
    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public long getSize() {
        return file.length();
    }

    @Override
    public void write(String fileName) throws IOException {
        // Not implemented for mock purposes
    }

    @Override
    public void delete() throws IOException {
        // Not implemented for mock purposes
    }

    @Override
    public String getHeader(String name) {
        return null;
    }

	@Override
	public String getSubmittedFileName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public java.util.Collection<String> getHeaders(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public java.util.Collection<String> getHeaderNames() {
		// TODO Auto-generated method stub
		return null;
	}

   
}
