From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Request about MAC Address (cross posted to ebtables and
	netfilter)
Date: Thu, 23 Sep 2004 17:46:09 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04092307461ea7d0c4@mail.gmail.com>
References: <1403218a040923054731f66fed@mail.gmail.com>
	<1095950130.1750.22.camel@wolfpack.ljm.dom>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095950130.1750.22.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

ahh
Really sorry, I was searching in IANA, and didn't find any information
Thanks alot Jason, you are one of the stars here.


On Thu, 23 Sep 2004 10:35:30 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Thu, 2004-09-23 at 08:47, Mohamed Eldesoky wrote:
> > I have seen this on my logs
> > Destination: 00:0c:76:e7:fa:a9 (Micro-St_e7:fa:a9)
> >
> > I have searched for the manufacturer assigned this mac, and I failed !!
> > Anyone knows anything about such manufacturer ??
> 
> according to:  http://standards.ieee.org/regauth/oui/index.shtml
> 
> a search for 000c76 yields:
> 
> 00-0C-76   (hex)                MICRO-STAR INTERNATIONAL CO., LTD.
> 000C76     (base 16)            MICRO-STAR INTERNATIONAL CO., LTD.
>                                 No 69, Li-De Street, Jung-He City, Taipe
>                                 Taipei
>                                 TAIWAN, REPUBLIC OF CHINA
> 
> googling for MICRO-STAR INTERNATIONAL leads us to:
> 
>         http://www.msicomputer.com/
> 
> i'd guess the MAC is from an onboard NIC from one of their motherboards.
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

