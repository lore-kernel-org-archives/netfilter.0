From: Michel van der Klei <michel@mitch-it.com>
Subject: Re: Need help with iptables and iprange module
Date: Thu, 15 Feb 2007 03:01:34 +0100
Message-ID: <20070215030134.5bac19da.michel@mitch-it.com>
References: <b6d73fa90702141745k3326bc2ei2c202cf91ca30bd6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b6d73fa90702141745k3326bc2ei2c202cf91ca30bd6@mail.gmail.com>
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
To: TheNokia <nokiairc@gmail.com>
Cc: netfilter@lists.netfilter.org

On Wed, 14 Feb 2007 20:45:41 -0500 TheNokia <nokiairc@gmail.com> wrote:
> I try want you said Michel but
> 
> debian:/glftpd/ftp-data/users# modprobe ipt_iprange
> modprobe: Can't locate module ipt_iprange
> 
> My version kernel is 2.4.27-2-386

It's like i said in my previous mail ..... you'll need kernel 
2.6.18 for the ipt_iprange module _without_ patch-o-matic.

I don't know if you're bound 2 kernel 2.4.27. If not i would 
recommend a kernel update. 

apt-get update && apt-get install linux-image-2.6.18-4-686

should do that trick for you.

Otherwise .... patch-o-matic isn't that hard ;-)

-- 


Michel van der Klei 
http://www.mitch-it.nl

	A brain is a wonderful thing, 
	everybody should have one!

