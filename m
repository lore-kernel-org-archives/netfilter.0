From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 12:27:53 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206031227090.10962-100000@wookie.shorewall.net>
References: <002101c20b30$bb406310$6301a8c0@JJONES1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002101c20b30$bb406310$6301a8c0@JJONES1>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Jones <jjones@merlintechnologies.com>
Cc: Iptables <netfilter@lists.samba.org>

On Mon, 3 Jun 2002, John Jones wrote:

> iptables -I FORWARD 1 -p udp -s 0.0.0.0 -d 10.0.0.10 -j ACCEPT

Either omit the "-s" option altogether or make that "-s 0.0.0.0/0".

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


