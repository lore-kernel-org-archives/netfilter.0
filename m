From: Navid Mohaghegh <navid@navid.ca>
Subject: I can't see any log activity for my LVS cluster
Date: Tue, 12 Oct 2010 22:18:48 -0400
Message-ID: <4CB51708.1000305@navid.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everyone,

I have a very simple LVS cluster with one director and two webservers
and it is working just fine.

However, for statistical analysis, I need to capture the respond time of
the webservres.

I was hopeing to use ulogd with debug enabled (loglevel = 1) to see what
is happening inside ipvsdm. Ulogd doesn't return anything and the logs
are empty.

Further I decide to directly look at the /var/log/messages and I don't
see any activity over there too!!!

Should I recompile kernel with debug enabled (i.e. to have
/proc/sys/net/ipv4/vs/debug_level )? I am using Debian sid ...
2.6.32-5-vserver-amd64 ... could you please help me? All I am trying to
do is to see how long it takes for each webserver to respond the http
request.

Thank you,
Navid
