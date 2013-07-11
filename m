From: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Subject: About how to use RATEEST interval and ewmalog
Date: Thu, 11 Jul 2013 18:36:26 -0430
Message-ID: <51DF3A72.7010205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=XfSYS3qzQ53EfM6Q8GIcKcNfgqFkEfBsYqaJet5OMos=;
        b=lKt6UEqkclNKsFrT9NRGXe+2Ayrf+V8+e42vuZZ30lDfekuknlNmmn0dGRUSbrR28s
         LLaBl2/lY7bC76X/297fN1g7P3xxAlaDAOaMQdDW/PbJl8O/tWvRo4JAkILTG6Q4Blfk
         lXzxCG+NMXXDOSxQ6AdZBVDVwlRtERaIr2h38MHFDcnKrcDLFTXz+ol59LTV+iixPraZ
         kJX2Voy9fpN3qNEU1931q+bdwa+BHO5ickoGjP2h+WzAwdQVBgJ7IDQ5RLhiTTvac8J6
         NPRphlZMG0M12TQnuiYHZo0STyXCKeC6wyMvQ3OehfWJFUV83X4LBXTdh8UTCOvWNXn3
         oUIQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi

On 22 Nov I did ask for an explanation on how to use --rateest-interval 
and --rateest-ewmalog but no one answered. My original question can be 
seen in [1] and is the following:

What is --rateest-interval and --rateest-ewmalog?

         --rateest-interval amount{s|ms|us}
                Rate measurement interval, in seconds, milliseconds or
microseconds.

         --rateest-ewmalog value
                Rate measurement averaging time constant.

I'm using interval 1.0s and ewmalog 2.0s but I don't understand how
these parameters works together.

Any further explanation?


[1] 
http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.general/45285
