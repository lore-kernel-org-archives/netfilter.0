From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: understanding how conntrack works
Date: Wed, 25 Oct 2006 09:02:27 -0700
Message-ID: <200610250902.27939.alan.ezust@presinet.com>
References: <2FEE63312285CF428A8480B07AC1C35903657F21@CHN-SNR-MBX01.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2FEE63312285CF428A8480B07AC1C35903657F21@CHN-SNR-MBX01.wipro.com>
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
To: anisha.chandrasekaran@wipro.com
Cc: netfilter@lists.netfilter.org

On Tuesday 24 October 2006 20:14, anisha.chandrasekaran@wipro.com wrote:
> Hello all,
>      Alan, I jus read your below mail regarding the conntrack facility.
> I am sorry that I am not able to help you with an answer to your query.
> I am actually writing this mail to ask you if you could help me know
> what are the structures that store conntrack details, i.e, if I want to
> drop a particular connection that is established which structure entry I
> should be parsing and deleting??????

After some searching, I came across these parts of the code:
nfct_create_conntrack (libnetfilter_conntrack.c:951)
This code creates a struct nfct_conntrack. 

Then there is the nf_conntrack_tuple 
(linux/include/net/netfilter/nf_conntrack_tuple.h:64)
which contains "the information to distinguish a connection")

I *think* this is the right place in the code. I hope someone else will 
correct me if this answer is wrong or incomplete :-)


