From: "Greg King" <j.greg.k@gmail.com>
Subject: asking external app for true/false value prior to opening a new session
Date: Mon, 15 Oct 2007 07:27:20 -0500
Message-ID: <12445fff0710150527u5e368a3cr4c81b2a6e0d579b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=KUy8MRReqoO4CqPUPLYxDb9fER9qqvnnYE3Eb+rrNOI=;
        b=Qf/ufCjoa3/ds5I+hBkJsE+NhEGsh3Gdfw0w8E/odfHnb790z3LA5D1A9ToEcWyNRmSD/ah9X4sQ8UwSoWar8hbInt+C/Nwxq1OM6k90mY3c/vVoY/p73ws97KasdU4A2hO146ci4st+KRvZz6KTgCZ1bx5xKBip83Xv4JYfN1o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Is there a way to create a rule that will ask an external application for a
true or false value before allowing a new connection to be established?

It seems the vendor(s) method is to code for applications (pam,
apache, x, etc) which IMO narrows the scope of what two-factor could
be protecting and complicating the matter of protecting remote
services in general.

My idea is to simply not allow the incoming connection via the
firewall until a two-factored connection has been validated. This way
I am not restricted to what few two factor agents the vendor(s) have.

thanks
