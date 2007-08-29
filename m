From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Netfilter_queue test program question
Date: Wed, 29 Aug 2007 11:42:59 +0200
Message-ID: <46D53FA3.9030805@freemail.hu>
References: <6043bfd00708290113j38b0f153k7acd38d09ab9c16e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6043bfd00708290113j38b0f153k7acd38d09ab9c16e@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Andy Cristina <acristin@gmail.com>
Cc: netfilter@lists.netfilter.org

Andy Cristina =EDrta:
> I've been attempting to play with netfilter_queue to see how effective
> a certain similarity hashing technique would work for identifying
> parts of documents being sent out over the network, but I haven't had
> much progress even getting the test program to work.
Just a few questions:

- Why do you want to do such things?
- How would you come over on the compressed files, MIME encodings?
- Are you attempting to stop some information thiefing?
> I can compile and link nfq_test.c fine, using both the old versions of
> libnfnetfiler and libnetfilter_queue available from ubuntu's apt, and
> by using the newest released versions compiled from source.
>
> However, in any case when I run the compiled nfq_test, the program
> seems to do nothing after setting the packet copy mode.  So it seems
> to me as if it is perpetually waiting for a packet to be sent over the
> netlink, but one never arrives, no matter how much network traffic I
> have.
>
> Am I missing some vital piece of setup?  When I run nfq_test, there
> are two netfilter modules loaded.  Should there be more?  Do they need
> to be configured somehow?  Is this the expected behavior?
>
> I have tested this both on my ubuntu install and on a friend's debian,
> both machines exhibit the same behavior.  Any help is certainly
> appreciated.
>
>  =20
Swifty



