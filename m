From: lising <xing.starwill@gmail.com>
Subject: about the nfq_set_queue_maxlen function
Date: Tue, 14 Aug 2007 22:21:12 +0800
Message-ID: <1187101272.6171.41.camel@lising-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=umW2PEx4mdp+3iIAmtKJSI5Ik/Jv/IJHzvJ/qkUVOkPFcxYLj1JrnS5wMwvktyhdI1yhMggFuYBr6kUATSDrSPxEHy+GrKFT/4MMjIAI/DV/w0vQ5MPt92HOdv9mklPiG72PP3XhaROpCSdAOkKCk4emYYgvza2zCgu5YA06LbE=
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
To: ssussman@starentnetworks.com, netfilter@lists.netfilter.org

Dear Scott,

     You can download the newest "libnfnetlink" library from the
www.netfilter.org. And when you successfully install the new library,
you will find the function definition in
the /usr/include/libnetfilter_queue/libnetfilter_queue.h. 
     You can use the function as the "nfq_set_mode" function in your
application.

Lixing
Aug.14 2007


