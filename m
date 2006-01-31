From: "P theodorou" <props666999@hotmail.com>
Subject: Re: firewall traffic simulation
Date: Tue, 31 Jan 2006 17:23:15 +0000
Message-ID: <BAY102-F34F6926F1DD84611895612AE080@phx.gbl>
References: <Pine.LNX.4.60.0601311203260.5649@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0601311203260.5649@darkstar.sysinfo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Thanks Ron for the reply

I could easily do that by having 2 computer and test the firewall script by 
pinging, nmap traffic generators etc. But unfortunately i have to 
demonstrate in a means of showing to my academic supervisor what i have 
produced. At least as much  as i can since firewalls require Internet 
presense and connected clients to function.

Is there any program which adds virtual ethernet drivers on a Unix machine ? 
I search on the internet but i couldn't find any


regards


>From: "R. DuFresne" <dufresne@sysinfo.com>
>To: P theodorou <props666999@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: firewall traffic simulation Date: Tue, 31 Jan 2006 12:11:35 
>-0500 (EST)
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On Tue, 31 Jan 2006, P theodorou wrote:
>
>>Hello
>>
>>I need to demonstrate my firewall script to my supervisor. Unfortunately 
>>there is no Internet connection at my supervisor's office. Moreover the
>>Iptables script assumes the usual eth0( ISP) and 2 clients( LAN). My 
>>laptop has just eth0 and threfore will be no connected to any other 
>>clients.
>>
>>My question is : Is there a way to demonstrate the functionality(SNAT,DNAT 
>>etc) of this script somehow ?
>>
>
>
>What do you mean by "demonstrate"?  How would running a script that goes 
>"blip" and sets up a number of rules behind the scenes be in any sense a 
>demo?  If you has set up a mail server, or an auth server or even an ftp 
>server, how might you go about demo'ing it's functionality?  You need to 
>actually *think* about what you are trying to accomplish.  Are you merely 
>showing the super the rules so he can audit those to make sure they do what 
>you claim they might?  That's not really a demo, at least not from my 
>perspective.  Are you actually needing to pass traffic through the firewall 
>to show how the rules you have in place block and allow varying forms of 
>traffic?  Then you need to log into a system outside the firewall and show 
>how trying this work and those does not.  Then also log into a system 
>behind the firewall and pass traffic of varying forms to demo how this is 
>allowed and works that this is not allowed and does not work.
>
>The key here is to sit and *think* about what you need to accomplish and 
>how or what your super needs to see to show to him/her what you have 
>completed.
>
>So, is it possible to demo that a firewall script works as designed, the 
>answer is yes.  Now how do you go about demonstrating that?  *think* about 
>what is required and then design something that shows that.
>
>Thanks,
>
>Ron DuFresne
>- -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
>...We waste time looking for the perfect lover
>instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFD35pMst+vzJSwZikRAmBLAJ9X1n0oN4O/OQuDgF0rT2YY5kvKKQCfSTbT
>6VrDseg9h6GIntJsaEWx9T8=
>=XDJI
>-----END PGP SIGNATURE-----



