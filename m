From: "Dominic Caputo" <jec6jec6@gmail.com>
Subject: Accept DNS Suffix
Date: Tue, 20 Mar 2007 11:08:50 +1100
Message-ID: <000f01c76a83$f8563dd0$6f05b00a@au.schpac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
	b=Pf+1McaDPjsiboMgHdS5cixIvA7qaHAa1PIFoVDvBowoOwDUdxYuucjusPGcqllh5o9KAUp36r1HEbJ/YsYkvlkijN64JGb632FW4toq2GN6n67mNMFpjiDjX8orM7cKih4pF5cdkAN3hwx0b6XgnSMioQ/nF7+PJC8jxwfhNv0=
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


