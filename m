From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sat, 21 Sep 2002 18:15:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0a9401c261c4$bc771400$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020921135239.CIIH27185.mta03-svc.ntlworld.com@there> <0a5001c261b9$541d3700$c6b22543@repligate> <20020921215923.PLBQ27185.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, September 21, 2002 4:59 PM
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits


> On Saturday 21 September 2002 10:53 pm, Jim Fleming wrote:
> 
> > > 16 bits - fragment identifier
> >
> > http://ipv8.dyn.ee/INFO/Papers/RIFRAF
> 
> Fair enough, but that's not IPv4.
> 
> As the webpage says, it's an extension to IPv4 which they've chosen to call 
> IPv8 (which I think is really confusing considering the next version due to 
> hit the streets is called IPv6).
> 

IPv4 has a 0100 in the first four bits of the 160 bits that come screaming at you down the wire...
...correct ?

Have you ever set the 16 bits of the Identification Field ?....and used those for Extended Addressing ?
...before you do that, do you agree those 16 bits do not get changed across the IPv4 global transport ?

If Fragmentation does NOT occur, what are the 16 bits in the Identification used for ?
...are you aware TCP has its own Identification bits ?

In fact, if Fragmentation does not occur or is not used, what are all 32 bits in the second word used for ?
....one bit is used to say...Don't Fragment (DF)....that frees up 31 bits, in theory...

Backing up, have you seen the Random Identification Field feature in *BSD ?
...where random values are placed in the Identification Field to fool systems that try to tell what O/S
one is running by looking at patterns in the Identification Field...

Since Random works, one can assume they can take some of the bits and set them for their purposes
and leave some others to be used with the incrementing counter approach used in many systems...
How many bits can be safely "re-used" ?....8...14 ?...with 14 that is two 7-bit Extended Addressing Fields...
...couple that with the 4-bits from the TOS field and one has 11-bits of Extended Addressing...

As for IPv6...that is a 320-bit header with a 0110 in the first 4 bits....and a lot of useless complexity and
overhead to follow which uses bandwidth which is still precious and often ends up with a 160-bit header
in front of the 320 bits, for a minimum total of 480 bits to accomplish what can be done in 160-bits.
...jump on that band-wagon if you like....but that is not IPv4....

Should we release the C@t ?
http://www.ddj.com/articles/1993/9310/

Jim Fleming
2002:[IPv4]:000X:03DB:...IPv8 is closer than you think...
http://www.iana.org/assignments/ipv4-address-space
http://www.ntia.doc.gov/ntiahome/domainname/130dftmail/unir.txt



