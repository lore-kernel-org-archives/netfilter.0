From: xun chen <cx8508@gmail.com>
Subject: ebtables basic usage problem
Date: Thu, 30 Aug 2012 10:55:09 +0800
Message-ID: <CAC47RkVFpLRE4LUAnSrFtzbK4nuN_7Qgp=uuUEFiqoxGPJO2BA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=YvoJyrplQDpF0GtigL5VtSsBas0lrwSIOH5nFBSgJqM=;
        b=cb5Cvk5Rg+iq/wCamqXTfBKO85O3O/XRmVLdpM17S/bEFpO4eJwBlaIiWfJ5uFl8of
         UrP+JEdDQOvAnShCo6EBIIenkKnXVjvVqkP2CfTUSgyvjBNxvLliBTaSh3LUHRxylfYl
         zKAkvmHLMcUECwG2sC3TI9/x0yK+FANLrsrrRRoWKpQQurub7PcJi634N1bhEa16phPE
         tQVaKRjzBs2ugX9JawpvozcVMMKjVaI3I1T7N9UdRKHSBHSESRa6B0t1GLwywUzzquhv
         uvGeXbLXTHYKEvPppeuuUxjrthjKKKHevDzbvqv45nvv/ayWqQCGwzKWVn6McKv39mOk
         Pr1Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, everyone

   After executing the following command:

    ebtables -A OUTPUT -j DROP

  should every outbound packet be dropped? But my internet seems ok
after inserting the rule, and when I use

   ebtables -L --Lc

  to check the counter, the counter is zero.

  The 'drop all' rule is the only rule in the table. Why doesn't it
match any packet? Do I miss anything?
  When I apply the same rule with iptables, it works. But I don't know
why it doesn't work with ebtables.

  Thank you!
