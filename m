From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Modify packets using netfilter
Date: Sat, 13 Dec 2003 15:49:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312131549.45158.Antony@Soft-Solutions.co.uk>
References: <007101c3c190$0b3d6450$cb0210ac@jz105>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007101c3c190$0b3d6450$cb0210ac@jz105>
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

On Saturday 13 December 2003 3:44 pm, Jee J.Z. wrote:

> Hi all,
>
> I am wondering whether we can modify one or more bits in a packet using
> netfilter? Could anybody help? Thanks in advance!

Which bits?

The mangle tables can do some, but not many.   Writing your own target to 
fiddle with other bits shouldn't be hard.

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


