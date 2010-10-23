From: Scott Mayo <scotgmayo@gmail.com>
Subject: Blocking machines by both Mac Address and IP address
Date: Sat, 23 Oct 2010 17:19:11 -0500
Message-ID: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=LwZCH2qgJPaOI0Qps7/JUPCa+OqYWhMm2v8I7e5u3vk=;
        b=MabmhzCiD/IqH4KEj3YWNwxsIfopyfglyJUOS7PyZFzi1jcu9uBvrvNZ5jX3gXZOMx
         bLEbyBPIziv9/S8jky/fd67NbKWFl4ZLSic3LuwW10h8v4q0bKHCjoWwVr1tEE1AA1MP
         IuUzxkVSQP9REgi2LqH7eBCtBxeguDgWvmTUk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have my DHCP server setup so that it hands out IP adresses according
to a machine's Mac address.  Is there a way to deny traffic to the
internet by both MAC address and IP address?

i.e.  If MAC address 00:11:22:33:44:55 is given IP address 192.168.0.1
by DHCP then that should be the only combo that can get to the outside
world.  If the IP address is changed to something else or if another
machine that has a different MAC address is given the IP address
192.168.0.1 statically, then in neither situation should the machine
be able to get out to the world.

Thanks for any info.
-- 
Scott
