From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: ftp contrack
Date: Tue, 25 Jan 2005 13:15:30 +0100
Message-ID: <9151ac2a05012504156caf097b@mail.gmail.com>
References: <22793.1106524634@www29.gmx.net>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <22793.1106524634@www29.gmx.net>
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
To: Mario Ohnewald <mario.Ohnewald@gmx.de>
Cc: netfilter@lists.netfilter.org

On Mon, 24 Jan 2005 00:57:14 +0100 (MET), Mario Ohnewald
<mario.Ohnewald@gmx.de> wrote:
> Hello List!
> 
> I am trying to redirect (NAT) to a internal ftp box (but both have a public
> ip).
> I am using those rules:
> 
> modprobe ip_conntrack_ftp ports=21,2121
> modprobe ip_nat_ftp

Hi Mario, 

Add "ports=21,2121" to the "modprobe ip_nat_ftp" command.
That should do the trick.

modprobe ip_nat_ftp ports=21,2121

Regards,
Filip

