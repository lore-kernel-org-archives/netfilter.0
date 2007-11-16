From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Matching by packet connection
Date: Fri, 16 Nov 2007 00:41:46 -0800
Message-ID: <d95317090711160041n20025e6fldce7387cef82a115@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=wXboPh/7ughmo3gAY8HfWAWztmQecUEcgpPWVaVAI2o=;
        b=It3GdXFDw4y6tqcyQpE27Pw134kC4TFOnVOu5VbOYPglD+of2Rr66n2Kw67KuzVwhSOrjO44xhq9HgauIjpUadKLEV9Y+WsvcysWvSpUI5yEOxEL/F27t4BNomY2qybBVN0DR8LrSzIgN7LLdN4G5ASaPVkn9ZYx/x86f0CWxQg=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Is there a way to match a packet against a connection's direction ?

e.g. apply this rule
iptables -A chain --destination mymachine -m state --state ESTABLISHED
-j another_chain
only to packets belonging to CONNECTIONS with destination mymachine

conntrack definitely knows has this information.
