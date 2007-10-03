From: John Madden <jmadden@ivytech.edu>
Subject: "DNAT" w/o changing source address?
Date: Wed, 03 Oct 2007 11:21:30 -0400
Message-ID: <1191424890.25752.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've got the typical DNAT configuration working fine, but I'm wondering
if there's a way to "port forward" without changing the source address
of the packets so that the destination sees the actual client's IP?

I've got a home-brewed load balancer running Pound for load balancing
HTTPS traffic to a cluster of web mail servers but I'd like to have
SMTP/POP/IMAP redirected to the single mail server without changing the
source address so things like RBL's still work.  This is to replace an
existing LVS installation, if that provides some idea of the workalike
I'm trying to build.  I've Googled for hours in vain...

Thanks,
  John



-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

