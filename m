From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and DNS
Date: Tue, 4 Jun 2002 20:34:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206041934.g54JYVA00495@Networker.rockstone.co.uk>
References: <scfca615.000@pzsj-office.pzs.com> <20020604184822.GX29214@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020604184822.GX29214@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi.


I'm not sure if I've got the gist of this thread correctly, but I thought it 
might be useful to point out the following, which may not be obvious:

If you create netfilter rules using hostnames, they get resolved once and 
once only at the time the rule is entered (ie when you type it in, or when it 
gets executed in a startup script), and from that point onwards, netfilter 
internally uses the numeric value in the ruleset.

If you create netfilter rules using IP addresses, then of course it's clear 
that these are the addresses being used in the rules, but internally 
everything is just the same.

Do not think that netfilter is going to do a series of DNS lookups every time 
a packet comes through and gets matched against a ruleset which you specified 
using hostnames !

Hope that helps ?



Antony.

