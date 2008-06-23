From: "Anatoly Muliarski" <x86ever@gmail.com>
Subject: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 11:23:02 +0300
Message-ID: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=UDWFlW6Fkq0NK5P6Jv/WpEPguR3q5DweEUrmVXh+OIw=;
        b=IB5PKljXYC8YNcHKa4hhFiMySglyJTt/j4m2uudEOaoEqMLPXhUD/HCo0aVcFE8Lx+
         WYO2sdKR3anOeKXrtZKF2qpWuX6dD45LBj9vmGyydTmzZbO8pcYQ5Ai2Dl+akATvAdHA
         CdARGMMBwdsC4FC31IlWHf3mnKMHzwq38H31Y=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I have an upstream link with guaranteed bandwidth( name it B1 ) and extra
not-guaranteed bandwidth( name it B2 ).
How can I marking the traffic by using iptables?
I need one mark for B1 traffic and another for B2 traffic.
iptables provides -m limit match but it works with packets only,
but I need one based on bytes/bits per second.
I'll be appreciate for any ideas.
--
Best regards
Anatoly Muliarski
