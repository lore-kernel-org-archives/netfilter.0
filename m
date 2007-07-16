From: Gnarlodious <lists.gnarlodious@gmail.com>
Subject: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 07:52:43 -0600
Message-ID: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=ST2UblyJsOFW2AaP77Rfu2Yb0RUFxH3izc6j7ZJaLsh27k8XvQS5mqKEtOh5GM0Yxp774fo1B19f4OtlzkNyeqqYTMb7xm8tfJ7EiKFr/KO/vlIKESJa2kfOHupEjsQLomBU0ULcSFmcWABLEMHIjeZe5xqQBG/ooHdyY/Bdiys=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hello and thank you for the help.

I am running iptables v1.3.7 on a LAN router and I need to block DHCP
requests. New machines on the router should be prevented from
broadcasting DHCP, forcing only that router to handle DHCP.

Can this be done? Seems like I have been trying for days without success.

-- Gnarlie
http://Gnarlodious.com/

