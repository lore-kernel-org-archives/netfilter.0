From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 14:24:54 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408311424.54003.gdh@acentral.co.uk>
References: <003701c48ee9$e1ad1f40$0a00a8c0@aziz>
	<001c01c48f4f$2a7f7140$0a00a8c0@aziz>
	<000a01c48f5c$e8560050$0a00a8c0@aziz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000a01c48f5c$e8560050$0a00a8c0@aziz>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 31 August 2004 14:17, security wrote:

> Hum still have crash. I have test again my memory, made 10 pass with
> memtest86 without error found.

This may be a long shot, but there may exist the possibility of the files on 
disk being corrupted when they were installed, due to your faulty memory?

Try to reinstall the kernel / modules and iptables userspace?

Cheers,
Gavin.

