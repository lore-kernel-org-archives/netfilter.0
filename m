From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: conntrack_rtsp
Date: Fri, 18 Nov 2005 10:16:56 -0600
Message-ID: <200511181016.56874.rob0@gmx.co.uk>
References: <73fc994a0511180311q39fe9a4crcad41da424f24acd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <73fc994a0511180311q39fe9a4crcad41da424f24acd@mail.gmail.com>
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

On Friday 2005-November-18 05:11, Arjen Smit wrote:
> Is anyone aware of the status of the conntrack_rtsp module. I am
> having a hard time compiling this.
>
> On 2.6 kernel source using Patch-o-matic (pom) I patched in the
> conntrack_rtsp module, compiled the kernel and ran 'make modules'

http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-rtsp-conntrack

Says: "Status: Beta - needs some testing and porting to 2.6.x". That 
means it won't work on 2.6.x.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

