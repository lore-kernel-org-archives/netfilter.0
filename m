From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Filter by state and destination mac
Date: Fri, 7 Dec 2007 23:48:57 -0800
Message-ID: <d95317090712072348h8218fa0pf5842208e174bb85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=ZgRp46WnY7w8sPzoiiE9bjodeX1qP4arlmyDzThAfTw=;
        b=nbWVBJWXQlc+vJU064QD0l/ZOpDKn7VAjkC9e9HlgBO/hU45FtfmaNYz8A2ybodVr1v7pMDz/4I5lE5KjHxsyCJqtocwKqelRI6ET4TlZMweEQPqS5Rr+Yiy3vJqENjCwLWkYYvOsrq5PC9b456xxE5D5wEMoJ67eiLD8PN6wNw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am filtering packets on a bridge. A simple bridge with no routing.
Only IP and ARP packets.

I want to filter on a combination of destination MAC and the connection's state.
ebtables, of course, knows nothing of connection state.
iptables does not match by destination MAC. Reading a bit I understand
that the option
doesn't exist because it doesn't always know it.
But in my case it does.

How can I filter on this combination then ?

The only option I currently see is a combination
- ebtables will filter on the FORWARD chain based on dest MAC, and
mark the packets.
- iptables will filter on the FORWARD chain based on the mark and the
connection state.

Ugly, but does the job.
Is there a better way ?
Would it make sense to extend the iptables code to allow this ?
