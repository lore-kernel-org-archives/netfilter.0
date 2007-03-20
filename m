From: "Dominic Caputo" <dominic.caputo@gmail.com>
Subject: Accept DNS Suffix
Date: Tue, 20 Mar 2007 11:02:26 +1100
Message-ID: <013901c76a83$0deb8f70$6f05b00a@au.schpac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
	b=ItvtAKBE/VetZOggcIK22uu3hLJp0Xav64+UmTJCgH5hT+C9Ygn4sM0WYOQccCyy4af+p0iGsdlsRBYzIMxsacYHO+TVqiFmUntgtETgFe8S90y2wRkifcPX0K1p3IKJ+5LslS+TBprl23LA8/FsqtvDUNU4wU204EU8CZqL6Sk=
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

I currently have an ISP that has multiple address ranges that I wish to 
accept in my iptables ruleset. Is it possible for me to use the DNS Suffix 
instead of the actual ip as they are currently dynamically assigned. e.g. 
iptables -s nsw.bigpond.net.au   (current assigned address is 
cpe-203-45-103-100.nsw.bigpond.net.au).

Alternatively if the above is not available would I be able to setup a 
dyndns account and get my dsl modem to update the account and within my 
iptables config set: iptables -s homegw.dynalias.com

Thanks

Dominic 


