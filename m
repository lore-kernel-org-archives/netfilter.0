From: rigoberto perez <rigo666beast@yahoo.com>
Subject: using ip_defrag in NF_IP_FORWARDING
Date: Fri, 29 Feb 2008 08:32:21 -0800 (PST)
Message-ID: <908456.17959.qm@web33207.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

I need to re-assemble a packet even if it don't go to
the local  machine. So, I called to the ip_defrag
function into the NF_IP_FORWARDING hook  and the
system crashes. It's that posible or it's a mistake?.
I wanna know: how I can re-assemble all incomming
packets?. Thanks.



      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
