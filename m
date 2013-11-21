From: patrick <nocommercials45@yahoo.com>
Subject: HFSC deadline time figure in SIGCOM Paper
Date: Thu, 21 Nov 2013 08:22:52 +0100
Message-ID: <528DB4CC.6050200@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1385018579; bh=L4qt/sEXp9U43C8enWmzgkBnTZwY3FLPySVtTCqwe04=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=vrpYgi6EXwVe8Mj5VTYHANJrabJb9diC1jlWtqrkQdKmmtKY2pKzy0j9M44VM6+u81DJIWGJkeKBld8ifM/tDH+k+73Irfg6kl0LsGPZcyAknf9+NPA9bqvZtEEMK98jtoEbVjEE6VsHILK+yO/mfVOExUGGKt9E6my5j8GwkCs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,


im looking at figure 2 in the SIGCOM97 paper describing HFSC. link:
http://trash.net/~kaber/hfsc/SIGCOM97.pdf

where in this picture can you see that the video sessions data delay is 
only 10ms, reading the description it should be visible in (b) but i 
just dont see it?

arrival packets for video session is the same in (a) and (b)
deadline computation for video is the same in (a) and (b)
and departing times is probably for both sessions, it changed slightly 
from (a) to (b) but nowhere near 10ms
