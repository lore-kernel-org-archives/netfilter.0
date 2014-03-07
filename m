From: shawn wilson <ag4ve.us@gmail.com>
Subject: logging process associated with a connection
Date: Fri, 7 Mar 2014 16:54:29 -0500
Message-ID: <CAH_OBie81XZ+MLwRMHKkNdJ12DLDwB0CXKHVxMqaLubXZ6me=Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=TklMHriN3bd7+u19zF5QhauMFHNPg9bN8W/kArXi+LY=;
        b=N1rku4BB72Hes2+dFnUroAtR25l22w52JEtkCT7rHTQJsGaqrj85Jl0HkrzCW7gDsj
         K7k0eY8lA+ZUY3sEKlkHmm9yg5O9pSYydlNDwyDifaLn6370ODJvcp2LSeVjYfRri/9t
         3x3IaOE3Es+e6cv3pDchMZFNd5Wis4lJU2OEfO74di3revJK5Y1nw0o+KNc8TXdsBwoU
         F+zDIljanW3MIm8SVXMcf7CgH9XMjTubtKcerGDhgfAUGJMdg0ONIsxMmKHcvh5zWYB6
         ngsFGAtyH+H6XH06KUYr3X4emgLoULmPoGlhKnWLtUhoOhGSLg2nCpT+jwknZzicLHfO
         bk/A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

What I ideally want is to log the cmdline associated with an outbound
packet. However, I'm open to suggestions.

What I have is:
Mar  7 16:30:25 name kernel: [618790.917928] FW: output REJECT IN=
OUT=eth1 SRC=1.2.3.4 DST=5.6.7.8 LEN=94 TOS=0x00 PREC=0x00 TTL=64
ID=56030 DF PROTO=UDP SPT=55207 DPT=514 LEN=74
(as one example - I can break out tshark and probably figure out what
it is, but I want something more in my logs)

I see this about auditd:
http://serverfault.com/questions/192893/how-i-can-identify-which-process-is-making-udp-traffic-on-linux
Specifically: # auditctl -a exit,always -F arch=b64 -F a0=2 -F a1=2 -S
socket -k SOCKET
Which isn't telling me what I want to know (or really, doesn't seem to
be reporting for each log I'm getting from ipt). Besides, if I've
already got an ipt LOG, why should I be using another tool for similar
info - this seems wasteful?
