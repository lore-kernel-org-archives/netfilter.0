From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: Best vpn w/ iptables.
Date: Sat, 21 Dec 2002 20:30:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E04C16F.9000607@istitutocolli.org>
References: <000e01c2a90a$79f7df50$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c2a90a$79f7df50$6601a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Rowan Reid wrote:
> I'm noticing the the IPSec implimentation uses/is protocol 50 -p 50
> Will any version of IPTables recognise this or will I be needing to
> update
> To the latest version of IPTables. I think I'm leaning towards 2.5.49
> kernel
> Implimentation givin I can trim it down enough to get something
> relitivly stable.

i've read that someone is using 2.5.51 in routers, so i think you should 
be able to get something stable with 2.5.52.
I don't know if _any_ version of iptables is going to recognize ipsec 
packets - even though i do not see any reason why it should not, but i 
suppose that a relatively recent version should do the job.
good luck.
andrea





