From: "chima s" <chima.s@gmail.com>
Subject: string
Date: Fri, 17 Oct 2008 20:00:04 +0530
Message-ID: <38e492ee0810170730t1a330ec2td54f190dd5f66aed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ZVIFwa+yLQ4JavpkcP2XhjtiGesCGGTibcYu/ZnRGQk=;
        b=qEqHLIHN/LOkrO5xOoeBkFq3SUYKL7FXB2S2LWFbW9ZaOkav5ugxQap/j0k9f7uSyG
         r0XIEPpYI/H5YvZTA3MpdNn/N/BJRTAE4E9fexsjMUDjry1MeGw2JInAbodPwztkbLe+
         K18hcaxTLZzL5C5HRgsX+UTg/5IH4Tp7r0F/0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I want to deny brwsing the yahoo and if somebody try to access the any
yahoo url, it will redirect to another page from my local web server.

I added the below rule

iptables -t nat -I PREROUTING -p tcp -m string --string "yahoo" --algo
bm -j DNAT --to-destination xxx.xxx.xxx.xxx

and tried www.yahoo.com, i am able to open the yahoo page instaed of
redirected page.

Is the rule is proper or am i missing any thing.


Thanks and Regards
Chima
