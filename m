From: "Jim Fleming" <JimFleming@ameritech.net>
Subject: Re: Setting and Routing on the TOS Source (SRC) and Destination (DST) Bits
Date: Sun, 22 Sep 2002 09:39:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0c8101c26245$dfe72c50$c6b22543@repligate>
References: <Pine.LNX.4.44.0209202140330.2337-100000@laptop1.agatha> <20020922082118.EQR13996.mta05-svc.ntlworld.com@there> <0c0601c2623c$f82fd7c0$c6b22543@repligate> <20020922134852.PSNX6699.mta01-svc.ntlworld.com@there>
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
> On Sunday 22 September 2002 2:35 pm, Jim Fleming wrote:
> 
> > Have you ever calculated how much bandwidth is wasted each year
> > with 4 of the 160 bits in every packet as useless ?
> 
> Actually, it's 4 of every 160 bits in the *header* - there's up to another 
> 1500 *bytes* (on ethernet) of body in the packet as well, so the wasted 
> bandwidth varies from 4/160 = 2.5% for empty packets, to 4/12160 = 0.03% for 
> full ones.
> 

Are there also 4 bits in each 320 bit header, when the value is 0110 ?

Is that an improvement ?....with 4/320 = 1.25%

Can routing be done on the values 0100 and 0110 ?

Are those 4 bits included in your count of useless routing bits ?

From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
"I still say that 83 of them make sense, 28 are doubtful, and 49 are useless.
=============================

Moving to the next 4 bits....do you agree they are almost always 0101 (5) ?

IF one assumed they did not care about "options", could those bits be assumed ?...and dropped ?
Is that another 2.5% savings ?

If the 0100 and the 0101 are tossed, is that a 5% savings ?

...or, could the 0100.0101 be considered an 8 bit "version" number ?
do people want or need 256 versions ?
==========

Going back to the mention of the *header*....could the 4-bits really be a header ?
...are all 16 values valid ?....what is 0000 and 0001 ?
Does the 4-bit "Version Header" describe the "Next Header" which follows ?

0000 = 0 bit header
0001 = ??
...
0100 = 160 bit header
...
0110 = 320 bit header

===========

Does NetFilter route based on the first 4 bits ?
http://www.netfilter.org/



