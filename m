From: =?iso-8859-2?B?SvpsaXVzIEJlbbk=?= <julius.bems@gmail.com>
Subject: in-memory table change
Date: Sat, 28 Apr 2007 11:17:51 +0200
Message-ID: <46331171.0580d666.73d8.ffffc398@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:from:to:subject:date:mime-version:content-type:content-transfer-encoding:x-mailer:thread-index:content-language:message-id;
	b=ElCBZXM+97bMAkZ0CkT3UuqQMmJbACgQoQV/KdOPWvQ2JPARopfrfe3WU0rthNTJO515Es2Fn04AGBq9/I1XUoDWjEnB7umdErXYAPN7NA4ErkVfElsCowxE3KIJgndgS5hEuw9h+D4Q1UCp6sLnAGnNnM6/KqTsXQd5+TOZsp8=
Content-Language: sk
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I have to try solve this problem:
-If there is a lot of rules in the packet filter table, it takes a quite
long time for 'iptables' to add a new rule (the change will be seen
sometimes in 30 seconds).
-I don't know how 'iptables' exactly works, but I thinked about =
changing=A0
rules exactly in the table, which is in-memory. It could take less time =
than
'iptables'

So my question is: Is this what I have described real? If yes, are there
some utilities by which I can change in-memory packet filter table? =
Because
I want avoid writing some code in c.

Thank You for reply



