From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Iptables limit match dropping packets
Date: Sat, 15 Nov 2014 19:39:15 +0530
Message-ID: <CAA5aLPggVxvrWEKn4pRTW_cQ-rpuY78adHEexo+jcZ6pTXwvNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=vFSVlVzmkkQAZ6geJn9Bjl9UXj4dV59SNalT5ljuOf4=;
        b=wM1WhTBEHlef3LUp7I+66Rbfc4lbR3Onmj8UJyhS9S83wGaOpkFWZekMWn2+pQvK4u
         1ObKkpXthxg+Az9UHOWmJAmOE+CWp4+a/y7Ajq05DBod2q2HecmLQ7ZlSaEjCDbgSFRG
         Az2SjXGOnOBxbw6D6aP2FMF7VNfeK1nhfM2oCd/yTYjw7C/2CO2ajjN+FeEa5afhRE+H
         zoNc6p27uHAtp2iwxNKR7wUKK1K7vv8xDEPTgWXirJxIjCx3rgNmBJ8FDKlDr3u9kFGx
         TvCrYF5+PvwMI3Dezk0ssyQXb2XpgFr3f20iIJKlGGRoFiPgShuU+8pEnxLabY95mD6P
         XaSw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have an iptables rule with limit as 1000/sec. When I am sending pkts
at 1000/sec there is a pkt drop observed around 2%. Why is that so?

Also, even if I increase limit to higher value at 5000 and send
sending pkts at 1000/sec only then also 2% pkt drop is observed. Why
is that so? Is there some limit as per design ?
