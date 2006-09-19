From: Aleksander <aleksander@krediidiinfo.ee>
Subject: Re: Question on Layer 7 filtering
Date: Tue, 19 Sep 2006 10:54:37 +0300
Message-ID: <450FA23D.7000100@krediidiinfo.ee>
References: <20060914060407.03444B543@mail.kisise>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060914060407.03444B543@mail.kisise>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Maxime Ducharme wrote:
> Sorry my question was not in the email,
> is there any equivalent for l7 filtering under iptables ?

Layer7 is for iptables.

iptables -t filter -A FORWARD -m layer7 --l7proto yourproto -j DROP

HTH,
	Alex

