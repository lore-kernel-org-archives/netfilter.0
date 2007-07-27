From: "Ganesan Natarajan" <natrajputra@gmail.com>
Subject: filtering in mangle table
Date: Fri, 27 Jul 2007 15:32:03 +0530
Message-ID: <dae53550707270302r6887a6a4g3c9ddfd7d070afab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=HNrIjvNAuTXVNbY88fpamnDK44un89rM5Fum3Ev2Dn6egtjN3I8N1ew4u7WGAFE5JMeQEn4f0WxYOOChfUkoy4GviZsTIwFfpZr/ANgmS91MlYF0KMiHDGbuLwWQTQVjeacaVjrmLPcXgIaigNGjb6ypKYVVc1ku4f82A8XTgO0=
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
To: netfilter@lists.netfilter.org

Hi,
       My requirement is before giving the packets to user space
application(even before routing) I need to filter the packets. This
has to be done for all packets irrespective of particular protocol.

so I am using the the mangle table with PREROUTING chain to filter as
well as to queue the packets using the DROP, QUEUE targets of
"iptables". But in man pages it is specified that the filter rules
should not be added into mangle table.

Is there any issues if I proceed with that?

Ganesan

