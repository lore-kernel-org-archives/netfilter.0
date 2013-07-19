From: higkoohk <higkoohk@gmail.com>
Subject: How to use a random IP from a pool of static IPs for outgoing traffic
Date: Fri, 19 Jul 2013 11:36:58 +0800
Message-ID: <CAMkC2Wjqx_R=_LCRnjiE1ppZYm+73ATjrLT0+C=UEw+Bp=gBMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=F8U2anYXut7+NVzuJKgkiSm6B+Sq7YhpjwG4Th5F6ao=;
        b=HCW+7sh/blAklJrBIox4Sd5W3zDJPjqxiES+7qk2pHwczrYa1u+xCVTMwJd2b3WCoX
         j8pLEL30edC+LTQnJPNniIRHRaZ9cIKZ73y2o6/27LHDMXYH6Qbn5RMDN1EsYbdt9i2w
         k67cy/oZNvdltehoEewbvoKJiWjQEyXUwvtijE+bg9nM2QKN297d/+zKqTkG/0cscAjR
         V5P+QErgG3F19jXNOg4A3Nss2jG/++WxMynt2xInnhureQHnTSEQM+uvoLn+oUjr1e4Z
         Y2/2cronejSfBMHVncH+9UDicNtjyGK9nU1XhjEdmUFsdOi70tsojT0B1zhg3AX+wyom
         4kjw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a linux server , use iptables as nat router.

This server has many public static IPs , but the machines in LAN
always use the default public ip as route.

We need random use out going IPs .

 Anybody know howto with iptables ?
