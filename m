From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Re(4): Need for GLIBC 2.3?
Date: Fri, 18 Apr 2003 19:59:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030418195923.10177608.arnt@c2i.net>
References: <OF671ACFC7.AC7798C4-ON88256D0C.005AE508-88256D0C.005B95F5@deepwoods.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF671ACFC7.AC7798C4-ON88256D0C.005AE508-88256D0C.005B95F5@deepwoods.com>
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
To: netfilter@lists.netfilter.org

On Fri, 18 Apr 2003 09:40:21 -0700, 
Carol Anne Ogdin <caogdin@deepwoods.com> wrote in message 
<OF671ACFC7.AC7798C4-ON88256D0C.005AE508-88256D0C.005B95F5@deepwoods.co
m>:

> 
> On 04/18 @ 09:05 AM, Arnt Karlsen wrote:
> >On Fri, 18 Apr 2003 07:37:47 -0700,
> >Carol Anne Ogdin <caogdin@deepwoods.com> wrote in message
> ><OFFF8865C2.2434357B-ON88256D0C.004E3CB8-88256D0C.00505D66@deepwoods
> >.co m>:
> >
> >> <snip>
> >>
> >> Thanks, Arnt, but that doesn't seem to get me where I need to go.
> >> when I run the command you recommend, I get
> >>       error: Name field must be present in package: (main package)
> <snip>
> >
> >..no .spec file in the tarball???  Which tarball? (url?)
> 
> I downloaded it directly from the link to the *.bz2 at
> http://www.netfilter.org/downloads.html#1.2.8.
> And the md5sum of the downloaded file is identical to that given at
> that site.
> Using rpmbuild v4.0.4

..you're right, no .spec in there, I'll mail you off list the  
.spec from the RH9 iptables-1.2.7a-2.src.rpm, it should make 
a workable starting point for 1.2.7a|8 for your RH-7.3.

..you 'rpmbuild -ba ' from the specfile, see the docs.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



