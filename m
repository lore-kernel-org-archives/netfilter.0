From: Thorsten Scherf <tscherf@web.de>
Subject: Re: port redirect for localy generated request
Date: Sat, 30 Aug 2003 10:04:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308301004.02160.tscherf@web.de>
References: <MCEJJKCAIMHFOKODABEIGEDCHNAA.cox@sinistro.net> <000801c36e35$3f7cee60$8c01a8c0@RSUNDARAM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c36e35$3f7cee60$8c01a8c0@RSUNDARAM>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

> With this rule incoming request for port 80 redirected to port 8080. But
> this is not working localy generated request.
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d LISTEN_IP -j DNAT --to
> LISTEN_IP:80

You have to use the OUTPUT Chain for localy generated packets:

iptables -t nat -A OUTPUT -p tcp --dport -d $LISTEN_IP -j DNAT --to 
$LISTEN_IP:8080


Greetings,
Thorsten Scherf
RHCE, RHCX

