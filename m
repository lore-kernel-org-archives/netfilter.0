From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: ftp contrack
Date: Tue, 25 Jan 2005 14:43:20 +0100
Message-ID: <9151ac2a05012505432914ff51@mail.gmail.com>
References: <22793.1106524634@www29.gmx.net>
	<9151ac2a05012504156caf097b@mail.gmail.com>
	<1106657609.22125.78.camel@nostromo.bgsecm.com>
	<1106646626.7431.1.camel@linux.site>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106646626.7431.1.camel@linux.site>
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
To: Mario Ohnewald <mario.ohnewald@gmx.de>
Cc: netfilter@lists.netfilter.org

On Tue, 25 Jan 2005 10:50:26 +0100, Mario Ohnewald
<mario.ohnewald@gmx.de> wrote:
> 
> by the way.
>  modprobe ip_nat_ftp ports=21,2121
> didnt work.
> 
Did you rmmod the ip_nat_ftp module before reloading it ?

Regards,
Filip

