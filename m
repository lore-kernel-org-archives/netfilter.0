From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: Re: inner workings of IP tables
Date: Sun, 29 Sep 2002 22:05:31 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <55639.64.86.49.17.1033326331.squirrel@www.icafe.co.tz>
References: <20020929091933.FWMZ13996.mta05-svc.ntlworld.com@there>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929091933.FWMZ13996.mta05-svc.ntlworld.com@there>
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
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

What about ease of use? The GUI
Multiple firewalls.
Management of firewalls.
Delegation of firewalls and types of rules.

I believe that CheckPoint has the level of application along with that
allows all of hte above. For Netfilter you have to build on top of it.

We can't compare apples to oranges.

CheckPoint goes a bit beyond packet filtering on the user
interaction/commercial side of it.

Antony Stone said:
> On Saturday 28 September 2002 3:11 pm, Naleendra@dms.lanka.net wrote:
>
>> I am working on the qualitative analysis of IPTABLEs... & I need to
>> compare it with Checkpoint. From what I've heard Checkpoint is still
>> the best.
>
> Have you heard this from people who have compared the products, and can
> show  you how they tested them, or have you heard this from people who
> either  bought or sell the Checkpoint product, on the basis that it's
> got the biggest  name in the market (the "no-one got fired for buying
> IBM" philosophy) ?
>
>> 1- Because there is minimal network load
>
> I do not think a firewall product can generate any network load.   A
> firewall  filters packets which pass through it, therefore the network
> load is created  by the clients and servers on either side, not by the
> firewall itself.
>
> Checkpoint's product is available to run on Windows Operating Systems,
> Solaris, Red Hat Linux, and Nokia IPSO (a BSD derivative).   The
> performance  of their product varies tremendously on these different
> platforms (from bad  to good in the order I've given), but that's no
> reflection on Firewall-1  itself.
>
> If you want netfilter to give you high performance, run it on a fast
> processor with enough memory.
>
>> 2- It works between the layers datalink & network making the OS that
>> much secure & making it a must pass-through layer for all pkts. in &
>> out.
>
> No - Check Point's product works at a higher level than netfilter, in
> my  opinion.   They are both OSI layer 3/4 filtering systems, however
> netfilter  is built into the Operating System kernel, whereas
> Firewall-1 is added on top  of the Operating System as an application.
>  There is, for example, no  inherent packet filtering in the Windows 2k
> kernel, yet once you put  Firewall-1 on top, it becomes a firewall.
>
> I would say that for this question netfilter is more secure because it
> is  embedded in the kernel; Firewall-1 is an application which could
> get stopped.
>
>> 3- It securely supports typical " loop-hole prone protocols such as
>> FTP, UDP & RPC protocols.
>
> What do you mean by "loop-hole prone" ?   FTP is well supported by
> netfilter  and is no less secure than Firewall-1's support for it.
>
> I don't know what you mean by UDP in this context, however I do not
> believe  there is any difference between the security of netfilter vs
> Firewall-1 for  UDP protocols.
>
> RPC is an application-level protocol (usually classified as OSI layer
> 5) and  both netfilter and Firewall-1 are stateful inspection packet
> filters.    Again, I do not believe there is any difference between the
> security of  netfilter vs Firewall-1 for RPC.
>
>> No, I am not here to brag about checkpoint. I hardly know the thing.
>
> Where have you got your information suggesting that Firewall-1 is
> better ?
>
>> I use a IPTables firewall. I need some info /web sites on how the
>> Iptables modules work.. yeah the inner workings. Can some one help
>> pls. ?
>
> If you want to see how netfilter works inside, the source code is
> readily  available, and you can really see how everything gets done.
> You won't get  *that* opportunity with Firewall-1,
>
> Check Point Firewall-1 does not have a flawless security record.   Did
> you  know, for example, that until FW-1 v4.1 (about 2 years ago) every
> version of  FW-1 allowed access from the Internet to any machine on the
> internal network  on TCP/UDP ports 53 under a standard installation ?
>
> Netfilter does not have a flawless security record either, but like
> most open  source projects, the flaws tend to get found sooner in the
> development cycle,  and they certainly get fixed pretty damned fast if
> they ever get out into a  released vesion, compared to commercial /
> proprietary systems.
>
> I wuld be very interested in any reproducible data you have comparing
> the  security of Check Point Firewall-1 with netfilter.
>
> Antony.
>
> --
>
> In science, one tries to tell people
> in such a way as to be understood by everyone
> something that no-one ever knew before.
>
> In poetry, it is the exact opposite.
>
> - Paul Dirac




Regards,

Cyberdude Murli
The Earth



