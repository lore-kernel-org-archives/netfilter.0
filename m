From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nslookup vs. dig
Date: Tue, 4 Jun 2002 21:11:26 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206042011.g54KBRA02612@Networker.rockstone.co.uk>
References: <Pine.LNX.4.04.10206041600230.15358-100000@lysa>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.04.10206041600230.15358-100000@lysa>
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

On Tuesday 04 June 2002 9:02 pm, Michael Montero wrote:

> I'll nslookup a domain and get temporary failure in name
> resolution.  Then I'll dig a completely different domain and get results
> successfully.  Then I will return to nslookup the first domain....which I
> did not lookup using dig.  And it resolves.

I don't know enough about the differences between nslookup and dig to suggest 
something specific here, but I guess the two obvious things for you to do 
would be to run ethereal on some machine looking at the interface of the 
machine you're doing the nslookup / dig on (I'm not quite clear whether this 
is your firewall machine, or something sitting on a LAN inside the firewall) 
and see if there's a characteristic difference in the way dig starts 
communicating from the way nslookup does (TCP / UDP naturally comes to mind 
here), and/or to post your iptables ruleset here so we can have a look and 
see if there's anything suspicious.   If you do that please make it clear 
what your network topology is.


Antony.

