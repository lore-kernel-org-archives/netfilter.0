From: "Srinivas Murthy" <codevana@gmail.com>
Subject: Use mangle to DROP/ACCEPT
Date: Fri, 2 Nov 2007 11:54:18 -0700
Message-ID: <df1bdeb10711021154hf8db4baya3fa2861ef027e84@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=xq8lyxXfUPPotOPmqnC0SskV3KHcabY2ftzDdvpb3nA=;
        b=dEw0Z5XI31PB+Md5qPgyj8Rb0gB1on4V0jquRG2tioMXlLjXVsAvRFjqBGsD+zi9AVqZIcBgOXJJBDDducqRJcu7askmxIUxK+vpMWPl1xrwj9p/tlIYsE6pUgpJMansQhCJuLgHalPCHpIFzBT2hq76OjiXU2EJbd4oIYPH9OY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
 Is it ok to use the "mangle" table to insert rules that can
DROP/ACCEPT pkts in the PREROUTE chain?

 I cannot use "filter" since that is registered in the INPUT chain and
I want these rules in the PREROUTE chain.

Thanks.
