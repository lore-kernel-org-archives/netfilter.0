From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Re(2): Need for GLIBC 2.3?
Date: Fri, 18 Apr 2003 07:37:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFFF8865C2.2434357B-ON88256D0C.004E3CB8-88256D0C.00505D66@deepwoods.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org


On Apr 18, Arnt Karlsen) wrote:
From arnt@c2i.net  Fri Apr 18 03:53:40 2003
>From: arnt@c2i.net (Arnt Karlsen)
>Date: Fri, 18 Apr 2003 04:53:40 +0200
>Subject: Need for GLIBC 2.3?
>On Thu, 17 Apr 2003 17:41:04 -0700,
>Carol Anne Ogdin <caogdin@deepwoods.com> wrote in message
><OFCE07B0DA.63D2DEA4-ON88256D0C.0002759A-88256D0C.0003C28A@deepwoods.co
>m>:
>
>> Red Hat 7.3 (v2.4.18) supplies iptables v1.2.5, which relies on glibc
>> v2.2.5.  I'd like to apply the rpm for v1.2.7a, but the RH distro
>> demands glibc v2.3.
<snip>
>>
>> What would you do?
>
>..'rpmbuild -ta iptables-1.2.8.tar.bz2' or somesuch,
>should use what you have in your box.
>You _may_ have to chuck in a few *-devel.rpm's etc,
>rpm should whine which to 'rpm -ivh'.
>
<snip>

Thanks, Arnt, but that doesn't seem to get me where I need to go.
when I run the command you recommend, I get
      error: Name field must be present in package: (main package)
      error: Version field must be present in package: (main package)
      error: Release field must be present in package: (main package)
      error: Summary field must be present in package: (main package)
      error: Group field must be present in package: (main package)
      error: License field must be present in package: (main package)
rpmbuild's -vv option produces nothing more detailed that this.

Not having any experience as a developer in Linux, I'm feeling overwhelmed
by what I don't know.

--Carol Anne




