From: "curby ." <curby.public@gmail.com>
Subject: Re: Iptables is resetting
Date: Fri, 5 Aug 2005 09:50:58 -0600
Message-ID: <5d2f379105080508503b9e516d@mail.gmail.com>
References: <62ddd33050804075057697edb@mail.gmail.com>
	<Pine.LNX.4.61.0508050828230.20623@yvahk01.tjqt.qr>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0508050828230.20623@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

On 8/5/05, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> Maybe something is calling iptables -F spuriously?

On 8/4/05, Joseph Nicholson <wjnicholson@gmail.com> wrote:
> I have listed the tables before I re-applied and see that they
> are all still there, but for some reason they stop working.=20

You mention that your userbase is large.  Wild guess, but could the
conntrack table be filling up or could it be some other load-based
thing?  I believe /proc/net/ip_conntrack stores state of tracked
connections.

