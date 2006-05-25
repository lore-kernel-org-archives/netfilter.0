From: Massimiliano Hofer <max@nucleus.it>
Subject: Re: Controlling an iptables-match from userspace
Date: Fri, 26 May 2006 00:00:55 +0200
Message-ID: <200605260000.56259.max@nucleus.it>
References: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
	<Pine.LNX.4.64.0605231402210.27281@mercury.sdinet.de>
	<815d745e0605230800t4b4f58a3s76f160788025fa95@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <815d745e0605230800t4b4f58a3s76f160788025fa95@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 23 May 2006 5:00 pm, Manfred Stock wrote:

> Thanks. That's close to what I'm looking for. Unfortunately, it does
> not seem to be maintained anymore - I could find the sources in
> netfilter's svn using google, but the last change was it's import into
> the new trunk directory 19 months ago... At least it compiles against
> 2.6.8 with only one warning, and seems to work. But I would very much
> prefer a solution which does not rely on /proc because I don't believe
> in it's future for this kind of stuff ;). Any ideas?

I recently became maintainer of the condition patch.
You can find a new version at 
"http://www.nucleus.it/pom-repo/condition.tar.gz". From now on it will be 
handled as an external repository.

I'm working on some other changes that should make it more acceptable, 
althought I've been busy in the last couple of weeks.

Some considerations:
- adding a new system call or ioctl is more intrusive than a proc interface;
- a file interface doesn't require a special app.

You could argue about putting it in /sys or in the brand new configfs.
I'd like feedback about the best way to handle this.

-- 
Saluti,
   Massimiliano Hofer
        Nucleus

