From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: fragment.c
Date: Wed, 5 Jun 2002 16:19:46 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206051519.g55FJsA28810@vulcan.rissington.net>
References: <3CEF4F3E0000C1ED@ims3c.cp.tin.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CEF4F3E0000C1ED@ims3c.cp.tin.it>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 05 June 2002 4:07 pm, luigicart@tin.it wrote:

> Hi I'm Luigi.I have a question:
> which are the differences between fragment.c file in linux-2.4.3 and
> linux-2.4.7? Thank you

Hi Luigi.

I don't think you'll find anyone on this list who can answer your question.   
For one thing, the kernels you ask about are both quite old (12 - 15 months 
ago).

Have you tried:

 - looking at the changelog files for kernels 2.4.4, 2.4.5, 2.4.6, 2.4.7 ?

 - looking in the patches from 2.4.3-2.4.4 etc to see if ip_fragment.c 
appears in any of them ?

 - doing a diff between the ip_fragment.c in 2.4.3 and the one in 2.4.7 ?


Antony.

