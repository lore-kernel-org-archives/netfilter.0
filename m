From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: How to upgrade iptables
Date: Wed, 30 Jun 2004 10:41:58 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504062922425fbe9f12@mail.gmail.com>
References: <40E18057.5060807@sto-procent.art.pl> <200406291602.37397.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406291602.37397.Antony@Soft-Solutions.co.uk>
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

yes use the same method if for remving iptable (binary package) you
used to installed it for example if it is RH or FC then use rpm -e
iptables or removepkg iptables (for slack)
and other method for other distros.
:)


On Tue, 29 Jun 2004 16:02:37 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> On Tuesday 29 June 2004 3:44 pm, boka wrote:
> 
> > Hi !
> >
> > After sucessfully build of new version of iptables, i have checked if
> > the rules are ok to new version. My previous version was 1.2.10.
> 
> Did you previously build 1.2.10 on your system in the same way?
> 
> If not (eg: if you installed one from a package manager, and you build the
> other from source), then you may have two different binaries (plus various
> bits of libraries) in more than one place on your system.
> 
> As a quick check, what does "whereis iptables" suggest?
> 
> For a longer list of files involved, see whether "locate iptables" seems to
> show duplicates etc.
> 
> If you do have more than one version installed, I suggest removing the older
> one (using the same method as was used to install it), and then reinstalling
> the new one.
> 
> If you built them both from source, make sure the install paths are the same
> on both occasions.
> 
> I've commonly seen iptables in either /sbin or /usr/sbin, and sometimes even
> /usr/local/sbin
> 
> Hope this helps,
> 
> Regards,
> 
> Antony.
> 
> --
> Most people have more than the average number of legs.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

