From: Mark <markryan@cfl.rr.com>
Subject: error message
Date: Sun, 6 Jul 2003 14:59:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307061459.42268.markryan@cfl.rr.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_eGHC/ZaCr2u+IX4"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--Boundary-00=_eGHC/ZaCr2u+IX4
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am using the following script to ban users with iptables.  I keep getting an 
error that says the following:
 
06.07.2003 14:38:41: Creating chain proftpdban to store blacklisted IPs
06.07.2003 14:38:41: Adding INPUT-rule which redirects to proftpdban
06.07.2003 14:38:41: Shutting down: Insertion of new rule in INPUT chain 
failed: Index of insertion too big

 
I have no idea what the error means or how to solve the problem.  Any help 
would be appreciated.
 
I have attached the perl script that I am using.
 
Mark

--Boundary-00=_eGHC/ZaCr2u+IX4
Content-Type: text/x-perl;
  charset="us-ascii";
  name="anti-hammer.pl"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="anti-hammer.pl"

#!/usr/bin/perl

# anti-hammer v. 0.1
# Copyright (c) 2003 Michael Renner <robe@amd.co.at>

#This program is free software; you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation; either version 2 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
#TODO : 
#
#Statefile/permbans/checking of hitcounters

use strict;
use warnings;
use IPTables::IPv4;
use File::Tail;
use Time::ParseDate;
use POSIX;

use vars qw (%ips %config);

my (%config) = (
    logtoparse => "/usr/local/sbin/proftpd.log",
    outputlog => "/usr/local/sbin/hammer.log",
    port => "21",
    chainname => "proftpdban",
    duration => "60",
    maxhits => "4",
    bantime => "86400",
    bofh => "1",
    logdebug => "1",
    logstatus => "1",
    logbans => "1",
    loginfos => "1",
    );


daemonize();
open_log();
init_sighandlers();
init_iptable();

parselog();
die("parselog() returned... this should not happen!\n");


############
#   SUBS   #
############

sub parselog {
  my ($log) = File::Tail->new(name => $config{'logtoparse'}, resetafter=>120, interval => 1);
  my ($line);

  my ($ctime) = time();

  while (defined($line = $log->read)) {
    chomp $line;

    if ((time() - $ctime) >= 60) {
      cleanup(\%ips);
      $ctime = time();
    }

    my ($logtime, $ip) = parseproftpd($line);

    if ($logtime > 0) {
      if (! exists($ips{$ip})) {
        $ips{$ip} = [];
      }

      my ($iparef) = \@{$ips{$ip}}; 
      if (($#$iparef < 0) || ($$iparef[0] ne "BANNED")) {
        storeip($iparef, $logtime, $ip);
        clearold($iparef, $ip);
        try_ban($iparef, $ip);
      } else {
        logit("debug", "%s: is already banned, probably lines from the logbuffer", $ip);
      }
    } 
  }
}

sub daemonize {
  chdir('/') || die("Can't chdir to /: $!");
  open(STDIN, '/dev/null') || die("Failed to set stdin to /dev/null: $!");
  open(STDOUT, '>/dev/null') || die("Failed to set stdout to /dev/null: $!");

  defined(my $pid = fork()) || die("Failed to fork: $!");
  exit if $pid;
  setsid() || die("Failed to start a new session: $!");
  open(STDERR, '>&STDOUT') || die("Failed to redirect STDERR: $!");
}


sub cleanup {
  my ($chain, $timeout) = ($config{'chainname'}, $config{'duration'});
  my ($now) = time();

  my ($ip, @unban);

  logit("status", "!!!!!! Cleanup-Run-Start !!!!!!");

  foreach $ip (keys %ips) {
    my ($iparef) = $ips{$ip};

    if ($#$iparef < 0) {
      logit("status", "%-15s: Deleting: Empty.", $ip);
      delete($ips{$ip});

    } elsif (($$iparef[0] eq "BANNED")) {

      if ($$iparef[1] < $now) {
        logit("status", "%-15s: Unbanning: %d seconds old", $ip, $now - $$iparef[1]);
        
        do_unban($ip, $chain);
        push @unban, sprintf("IP %s got unbanned, Ban expired %d seconds ago", $ip, $now - $$iparef[1]);
        delete($ips{$ip});
        
      } else {
        logit("status", "%-15s: Banned: %d seconds left", $ip, $$iparef[1] - $now);
      } 

    } elsif ($$iparef[-1] < ($now - $timeout)) {
      logit("status", "%-15s: Deleting: %d seconds old", $ip, $now - $$iparef[-1]);
      delete($ips{$ip});

    } else {
      logit("status", "%-15s: Still active: %d seconds old, %d hit(s) recorded", $ip, $now - $$iparef[-1], $#$iparef + 1);
    }
  }

  logit("status", "!!!!!! Cleanup-Run-End !!!!!!");
  logit("ban", $_) foreach (@unban);
}

sub do_unban {
  my ($ip, $chain) = @_;
  my ($it) = IPTables::IPv4::init('filter');
  my (@banr) = $it->list_rules($chain);
  my ($rule);

  foreach $rule (@banr) {
    if ($rule->{'source'} eq $ip) {
      $it->delete_entry($chain, $rule) || shut_down("Deletion of banrule for $ip in $chain failed: $!");
    }
  }
  $it->commit();
}

  
sub storeip {
  my ($iparef, $ctime, $ip) = @_;

  if ($#$iparef >= 0) { 
    if (${$iparef}[-1] <= $ctime) {
      logit("debug", "%-15s: Storing hit %d", $ip, $ctime);
      push(@$iparef, $ctime);

    } else {
      logit("error", "Array for %s has a newer element than %d (possible clock jump?), clearing it", $ip, $ctime);
      @$iparef = ($ctime);
    } 
  } else {
    push(@$iparef, $ctime);
    logit("debug", "%-15s: First hit: %d", $ip, $ctime);
  }
}

sub clearold {
  my ($iparef, $ip) = @_;
  my ($timeout) = ($config{'duration'});
  my ($now) = time();

  while (($#$iparef >= 0) && (${$iparef}[0] < ($now - $timeout))) {
    my ($removed) = shift(@$iparef);
    logit("debug", "%-15s: Removed $removed", $ip);
  }
  logit("debug", "%-15s: %d hit(s) stored", $ip, ($#$iparef + 1)); 
}

sub try_ban {
  my ($iparef, $ip) = @_;
  my ($treshold, $chain, $bantime) = ($config{'maxhits'}, $config{'chainname'}, $config{'bantime'});
  
  if ($#$iparef >= ($treshold - 1)) {
    logit("ban", "IP %s gets banned now for %d seconds (%d hits in %d seconds)", $ip, $bantime, $treshold, $$iparef[-1] - $$iparef[0]);

    do_ban($ip, $chain, $bantime);

    $#$iparef = 1;
    $$iparef[0] = "BANNED";
    $$iparef[1] = time() + $bantime;
  }
}

sub do_ban {
  my ($ip, $chain, $bantime) = @_;
  my ($it) = IPTables::IPv4::init('filter');

  my (%newrule) = (
      source => $ip,
      jump => 'DROP',
      );

  $it->append_entry($chain, \%newrule) || shut_down("Insertion of ban-rule into $chain failed: $!");
  $it->commit();
}

sub init_iptable {
  my ($it) = IPTables::IPv4::init('filter');
  my ($chain, $port, $bofh) = ($config{'chainname'}, $config{'port'}, $config{'bofh'});
  my ($state, $rule);

  if ($it->is_chain($chain)) {
    logit("error", "Chain %s exists - flushing entries", $chain);
    $it->flush_entries($chain);
  } else {
    logit("info", "Creating chain %s to store blacklisted IPs", $chain);
    $it->create_chain($chain);
  }

  my ($cicrc) = clear_input_chain($it, $chain);
  shut_down($cicrc) if ($cicrc ne "");

  if ($bofh) {
    $state = ['NEW', 'ESTABLISHED', 'RELATED']
  } else {
    $state = ['NEW']
  }

  my (%newrule) = (
      protocol => "TCP",
      'destination-port' => $port,
      matches => ['state'],
      state => $state,
      jump => $chain,
      );

  logit("info", "Adding INPUT-rule which redirects to %s", $chain);

  $it->insert_entry('INPUT', \%newrule, 1) || shut_down("Insertion of new rule in INPUT chain failed: $!");
  $it->commit();
}

sub clear_input_chain {
  my ($it, $chain) = @_;
  my (@inputr) = $it->list_rules('INPUT');

  my ($rule);
  foreach $rule (@inputr) {
    if ($rule->{jump} eq $chain) {
      logit("debug", "Deleting rule in INPUT chain which jumps to %s", $chain);
      $it->delete_entry('INPUT', $rule) || return("Deletion of rule in INPUT chain failed: $!");
    }
  }
  return("");
}

sub logit {
  my ($priority, $message, @strings) = @_;
  my ($debug, $status, $bans, $info) = ($config{'logdebug'}, $config{'logstatus'}, $config{'logbans'}, $config{'loginfos'});
  my ($timestamp) = strftime("%d.%m.%Y %H:%M:%S", localtime(time()));

  if ((($priority eq "debug") && ($debug)) 
      || (($priority eq "status") && ($status)) 
      || (($priority eq "ban") && ($bans))
      || (($priority eq "info") && ($info))
      || ($priority eq "error")) {
    $message = "$timestamp: $message\n";
    printf(LOG $message, @strings);
  }
}

sub open_log {
  my ($logfile) = ($config{'outputlog'});
  open(LOG, ">>$logfile") || die("Failed to open logfile $logfile: $!\n");
  select(LOG);
  $|=1;
}

sub parseproftpd {
  my ($line) = @_;

  #Datetime: $1, IP: $3
  if ($line =~ /^([a-zA-Z]{3}\s+[0-9]{1,2}\s+([0-9]{2}:){2}[0-9]{2}).*\([a-zA-Z0-9\-\.]+\[(([0-9]{1,3}\.){3}[0-9]{1,3})\]\):\ FTP\ session\ opened\.$/) {
    my ($ctime, $ip) = ($1, $3);
    $ctime = parsedate($ctime);
    return($ctime, $ip);
  }
}

sub shut_down {
  my ($reason) = @_;
  my ($chain) = $config{'chainname'};
  my ($it) = IPTables::IPv4::init('filter');

  $reason = "Shutting down: $reason";
  
  logit("error", $reason);

  my ($cicrc) = clear_input_chain($it, $chain);
  logit("error", "Shutting down: %s", $cicrc) if ($cicrc ne "");

  if ($it->is_chain($chain)) {
    $it->flush_entries($chain) || logit("error", "Shutting down: Failed to flush entries of %s: %s", $chain, $!);
    $it->delete_chain($chain) || logit("error", "Shutting down: Failed to delete chain %s: %s", $chain, $!);
  }

  $it->commit();
  close(LOG);
  exit;
}

sub handle_signal {
  my ($signame) = @_;
  shut_down("Signal SIG$signame received");
}

sub init_sighandlers {
  $SIG{INT} = \&handle_signal;
  $SIG{ABRT} = \&handle_signal;
  $SIG{TERM} = \&handle_signal;
}

--Boundary-00=_eGHC/ZaCr2u+IX4--


