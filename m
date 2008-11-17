From: sean darcy <seandarcy2@gmail.com>
Subject: conntrack: will it restart after delete?
Date: Mon, 17 Nov 2008 11:31:12 -0500
Message-ID: <gfs68h$560$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've had a problem with a udp connection being setup before DNAT, 
occurred. See "where are my udp packets going?" Nov 15, 2008.

So just before setting up DNAT I'd propose to run:

conntrack -D -p	udp --dport 4569

but the user guide says this "blocks" the connection. I only want to 
flush/empty it, and let it start again with DNAT working.

Does this do it? Or some other command?

sean

