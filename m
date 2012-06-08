From: =?iso-8859-1?b?Sm9z6Q==?= Pablo =?iso-8859-1?b?UOlyZXo=?= 
	<josepablo@correo.co.cr>
Subject: How to obtain KBytes/sec in/out from a rule in real time
Date: Fri, 08 Jun 2012 00:30:37 -0600
Message-ID: <20120608003037.0ud7f668g84kgk4c@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

HellO!

Anybody know if a tool or script exists out there to obtain the
KBytes/sec in/out from a rule in real time

In other words something that can parse something like this:

# iptables -L INET_IN_PORT -v -x
# iptables -L INET_IN_PORT -v -x -n

Thanks!

-JP

