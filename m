From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: state NEW logging
Date: Thu, 7 Aug 2014 16:56:49 +1000
Message-ID: <CAMD-=V+bZ9bdd-U=6HPT0w6w-jqPA4ZxtqCjVdJOTJnQY75ypw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=DeZuaSwIWm62de5EQVWXyo0RnOs8iDVuAmlJESm83C4=;
        b=HPXdNDfCGPbv8dqzjfZK+WRlp4C8cBXBAhlA/WAi0JYcu3G08KtOi9tRRKEsaiBIM2
         MPrL+hFzZ4aGkX/gqi4V5JwNsL8j3bpZ7spM9fuEUUieidKh/MHB1i5kB3qi0xLIow4U
         r9QHtT2GSvXUXyV8hN1k0AegjRnYFc7Pu8A44ih+sPV3bKpRVrGLHSB9OtdreVzO1rSl
         RxnI/9Y5vNCTWKmjX1NQy2c09mxqbPfRdGWKKmTlf5HG1xCRXPV/Hjwfv1pXYaiwQTU5
         haXDz/rYvRiiUbQzWrPy6s+w8u+i3+VZk/IFTkIQcBJtU3btZURdMQt5pUKuLRb15fCa
         MKiQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

With the changes to states in recent times, is

/usr/sbin/ip6tables -A INPUT -p tcp --dport 22 -m state --state NEW -j LOG
still the recommended way to log conns? or is it cstate now?

Thanks
