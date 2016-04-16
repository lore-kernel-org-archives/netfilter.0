From: AllKind <AllKind@fastest.cc>
Subject: [announce] conntrack-tools-bash_completion 1.0 released
Date: Sat, 16 Apr 2016 09:42:07 +0200
Message-ID: <d727dd6f-ae29-12da-4715-18664ec534fd@fastest.cc>
Reply-To: AllKind@fastest.cc
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=fastest.cc; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=+Uj9R131lUU3ygDyq6IsiByFaCs=; b=Bs+Vw/DRIskr1FXvo5o4X
	yCcpZcM5sOFeyvrBwmDjU1ebb/EohknZyS1dFaKS4a3Yycu8yS5rMLuP7ERP7O6Z
	KyWjlXAMPj1ddY3nbXAp0olIFxwoflKp/Q7lInE+UO5B6fXd3fuakvgU4MzjaYVi
	ZDbgZnOzpNBr8V0b5T5Gao=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:reply-to:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=+Uj9R131lUU3ygDyq6IsiByFaC
	s=; b=SBYvvhpFGy5aVswq9AKp0ClUImzoRzXV55lIerbZsTAOFtHhAVWFdqUtqJ
	5/HQnJrdAz2Sdig5FVR4SVsNv3jmWQ/BmNnZ+I+bjhIdjSpNRbOL4P18hGej+LCt
	KqDFi6ELMumA92FTsR05NLfVdGStLGM7eXFNK4E2wnmza2ctg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Good day everybody!

I've written bash shell programmable completion code for the 
conntrack-tools.
This package includes completions for conntrack, conntrackd and nfct.

http://www.netfilter.org/projects/conntrack/index.html

It's available for you at these locations:

https://sourceforge.net/projects/conntrack-tools-bash-compl/
https://github.com/AllKind/conntrack-tools-bash_completion

I hope you can make use of it!

Best regards,
AllKind


