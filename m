From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: static IP to dynamic IP
Date: Fri, 15 Oct 2004 20:21:03 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015182103.C200A295@sterenborg.info>
References: <20041015181445.16647.qmail@web21524.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041015181445.16647.qmail@web21524.mail.yahoo.com>
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

netfilter-bounces@lists.netfilter.org wrote:
> --- kate <kate7234@yahoo.com> wrote:
> 
>> Hi, I am trying to modify a fw script that would work for my small
>> lan, except I need to change references of static IP and SNAT. to
>> eth0 and MASQUERADE, - but when I run the script it gives me Bad
>> argument `eth0'
> 
> It is Linux kernel 2.6 FC2
> Thanks in advance
> kate

Do you have and did you load the module ipt_MASQUERADE ?


Gr,
Rob


